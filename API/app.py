from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin
import re
import requests
import json



app = Flask(__name__)
CORS(app)

def physicalPrices(upc):
    value = {'target': 'Product not found!', 'walgreens': 'Product not found!', 'staples': 'Product not found!', 'walmart': 'Product not found!', 'bestbuy': 'Product not found!'}
    
    # Target, Staples, Walgreens, Walmart API.
    r = requests.get("https://api.barcodelookup.com/v2/products?barcode={}&formatted=y&key=3jn22y9gwogd6j0gs41iie79l40xyk".format(upc))
    response = r.json()
    for i in range(len(response["products"][0]['stores'])):
        if response["products"][0]['stores'][i]["store_name"] == "Target":
            value["target"] = response["products"][0]['stores'][i]["store_price"]
        elif response["products"][0]['stores'][i]["store_name"] == "Walgreens":
            value["walgreens"] = response["products"][0]['stores'][i]["store_price"]
        elif response["products"][0]['stores'][i]["store_name"] == "Staples":
            value["staples"] = response["products"][0]['stores'][i]["store_price"]
        elif response["products"][0]['stores'][i]["store_name"] == "Walmart":
            value["walmart"] = response["products"][0]['stores'][i]["store_price"]
        else:
            pass
        
    # Best Buy API
    r = requests.get("https://api.upcitemdb.com/prod/trial/lookup?upc={}".format(upc))
    response = r.json()
    for i in range(len(response['items'][0]['offers'])):
        if response['items'][0]['offers'][i]['merchant'] == 'Best Buy':
            value['bestbuy'] = str(response['items'][0]['offers'][i]['price'])
        else:
            pass
    
    
    return value



def onlinePrices(upc):
    value = {'tigerdirect': 'Product not found!'}
    
    # Tigerdirect API
    r = requests.get("https://api.upcitemdb.com/prod/trial/lookup?upc={}".format(upc))
    response = r.json()
    for i in range(len(response['items'][0]['offers'])):
        if response['items'][0]['offers'][i]['merchant'] == 'TigerDirect':
            value['tigerdirect'] = str(response['items'][0]['offers'][i]['price'])
        else:
            pass
    return value


def productInfo(upc):
    value = {}
    r = requests.get("https://api.barcodelookup.com/v2/products?barcode={}&formatted=y&key=3jn22y9gwogd6j0gs41iie79l40xyk".format(upc))
    response = r.json()
    value['productname'] = response["products"][0]['product_name']
    value['productimage'] = response["products"][0]['images'][0]
    
    
    return value
    

def status():
    value = {'target': False, 'walgreens': False, 'staples': False, 'walmart': False, 'bestbuy': False, 'tigerdirect': False}
    # API CHECKS - BarcodeLookup
    r = requests.get("https://api.barcodelookup.com/v2/products?barcode=190199098428&formatted=y&key=3jn22y9gwogd6j0gs41iie79l40xyk")
    if r.status_code == 200:
        value['target'] = True
        value['walgreens'] = True
        value['staples'] = True
        value['walmart'] = True
        
    # UPCITEMDB API CHECK
    r2 = requests.get("https://api.upcitemdb.com/prod/trial/lookup?upc=190199098428")
    if r2.status_code == 200:
        value['bestbuy'] = True
        value['tigerdirect'] = True
        
        
        

    return value



@app.route('/getstatus', methods=['GET'])
def statusCall():
    return jsonify(status())

@app.route('/getphysicalprice', methods=['GET'])
def physicalPricesCall():
    upc = request.args.get("upc")
    status = physicalPrices(upc)
    return jsonify(status)




@app.route('/getonlineprice', methods=['GET'])
def onlinePricesCall():
    upc = request.args.get("upc")
    status = onlinePrices(upc)
    return jsonify(status)


@app.route('/getproductinfo', methods=['GET'])
def productInfoCall():
    upc = request.args.get("upc")
    status = productInfo(upc)
    return jsonify(status)




