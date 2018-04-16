<html>
    <head>
        <style type="text/css">
            table, th, td {
                border: 1px;
                border-style: solid;
                border-color: #696969;
                color:#F0F8FF;
            }
        </style>
    </head>
    <body style="background-color:#B0C4DE;">
        <h1 style="color:#696969;">Purchase History</h1>
        <hr>
            <p style="color:#696969;">The purchase history is:</p>
        <?php
            
            /*** mysql hostname ***/
            $hostname = 'localhost';
            $username = 'npeters' ;
            $password = 'newword' ;
            
            
            try {
                $dbh = new PDO("mysql:host=$hostname;dbname=ski_rental_inventory", $username, $password);
                /*** The SQL SELECT statement ***/
                $select ='SELECT * FROM PurchaseHistory';
                $sql = $select;
                echo '<table><tr><th>Purchase History id</th><th>Equipment Type</th><th>Amount</th><th>Ski or Snowboard Type</th><th>Vendor id</th></tr>';
                foreach ($dbh->query($sql) as $row)
                {
                    echo '<tr><td>'.$row['idPurchaseHistory'].'</td><td>'.$row['EquipmentType'].'</td><td>'.$row['Amount'].'</td><td>'.$row['SkiSnowboardType'].'</td><td>'.$row['Vendor_idVendor'].'</td></tr>';
                }
                echo'</table>';
                
                /*** close the database connection ***/
                $dbh = null;
                
            }
        catch(PDOException $e)
        {
            echo $e->getMessage();
        }
        ?>
    </body>
</html>