import pickle
import pandas as pd
from sklearn.preprocessing import StandardScaler
from flask import Flask, jsonify, request

# Charger le modèle depuis le fichier pickle
with open('metroapp/Mobile/flaskapp/decision_tree_model.pkl', 'rb') as file:
    model = pickle.load(file)

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    # Récupérer les données d'entrée sous forme de JSON
    input_data = request.get_json()

    df1 = pd.read_excel('metroapp/Mobile/flaskapp/data.xlsx')
    df1['Time']=pd.to_timedelta(df1['Time'].apply(lambda x: x.strftime('%H:%M:%S'))).dt.total_seconds() / 60
    df1['Direction_Metro'] = df1['Direction_Metro'].replace(-1, 0)
    list_data = [value for key, value in input_data.items()]
    list_data.append(1)
    x=list_data[2]
    list_data[2]=int(x[0:2]) * 60 + int(x[3:5]) + int(x[6:8]) / 60
    df1.loc[len(df1.index)] = list_data
    print(df1)
    from sklearn.preprocessing import StandardScaler
    sc = StandardScaler()
    NumericCols=["Ligne","Day","Time","Distance"]
    df1[NumericCols] = sc.fit_transform(df1[NumericCols])
    # Extract the column you want to encode
    column_to_encode = df1['Num Station']
    # Use pandas get_dummies() function to perform dummy encoding
    dummy_df1 = pd.get_dummies(column_to_encode, prefix='Num Station')
    # Concatenate the dummy encoded columns to your original DataFrame
    df1 = pd.concat([df1, dummy_df1], axis=1)
    # Drop the original column that was encoded
    df1.drop('Num Station', axis=1, inplace=True)
    df1=df1.iloc[[-1]]
    df1.drop('Output', axis=1, inplace=True)
    df1
    prediction = model.predict(df1)[0] / 60
    # Renvoyer la prédiction sous forme de JSON
    return jsonify(prediction.tolist())

if __name__ == '__main__':
    app.run()
