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
        <h1 style="color:#696969;">Vendor</h1>
        <hr>
            <p style="color:#696969;">The vendors:</p>
        <?php
            
            /*** mysql hostname ***/
            $hostname = 'localhost';
            $username = 'npeters' ;
            $password = 'newword' ;
            
            
            try {
                $dbh = new PDO("mysql:host=$hostname;dbname=ski_rental_inventory", $username, $password);
                /*** The SQL SELECT statement ***/
                $select ='SELECT * FROM Vendor';
                $sql = $select;
                echo '<table><tr><th>Vendor id</th><th>Brand Name</th><th>Buyer or Seller</th></tr>';
                foreach ($dbh->query($sql) as $row)
                {
                    echo '<tr><td>'.$row['idVendor'].'</td><td>'.$row['BrandName'].'</td><td>'.$row['Buyer/Seller'].'</td></tr>';
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
