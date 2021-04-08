from web3 import Web3
w3 = Web3(Web3.WebsocketProvider('ws://127.0.0.1:8576'))
w4=Web3(Web3.HTTPProvider('http://127.0.0.1:8575'))
print(w3.isConnected())
print(w3.eth.block_number)
a=w3.eth.syncing
print(a)
print("http")
print(w4.isConnected())
print(w4.eth.block_number)
b=w4.eth.syncing
print(b)
