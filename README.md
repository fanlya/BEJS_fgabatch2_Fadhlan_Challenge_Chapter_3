# BEJS_fgabatch2_Fadhlan_Challenge_Chapter_3
![alt text](https://github.com/fanlya/BEJS_fgabatch2_Fadhlan_Challenge_Chapter_3/blob/master/Database%20diagram.drawio.png)

Terdapat 6 entitas
1. entitas customers menyimpan data-data diri nasabah
2. entitas account memberikan informasi saldo serta masuk kedalam sistem bank dimana 1 nasabah memiliki banyak akun
3. entitas account type menyimpan informasi tipe akun yang terdapat dalam 1 akun
4. entitas account login menyimpan informasi username dan password apabila dibutuhkan login ke dalam sistem bank
5. entitas transaction menyimpan log aktifitas transaksi nasabah
6. entitas transaction type menyimpan tipe transaksi yang dilakukan nasabah

relasinya
1. Customers One to Many Account
2. Account type One to Many Account
3. Account login One to One Account, account login weak entity
4. Transaction Many to One Account
5. Transaction Type One to Many Transaction
