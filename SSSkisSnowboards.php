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
        <h1 style="color:#696969;">Slopeside Sports Skis and Snowboards</h1>
        <hr>
            <p style="color:#696969;">The current Ski and Snowboard inventory of Slopeside Sports is:</p>
        <?php
    
            /*** mysql hostname ***/
            $hostname = 'localhost';
            $username = 'npeters' ;
            $password = 'newword' ;
    
    
            try {
                $dbh = new PDO("mysql:host=$hostname;dbname=ski_rental_inventory", $username, $password);
                /*** The SQL SELECT statement ***/
                $select ='SELECT * FROM SkisSnowboards WHERE Location_idLocation="SlopesideSports"';
                $sql = $select;
                echo '<table><tr><th>Ski/Snowboard id</th><th>Age</th><th>Type</th><th>Brand</th><th>Model</th><th>Size</th><th>Ski or Snowboard</th><th>Purchase History id</th><th>Binding id</th><th>Purchase Cost</th></tr>';
                foreach ($dbh->query($sql) as $row)
                {
                    echo '<tr><td>'.$row['idSkisSnowboards'].'</td><td>'.$row['Age'].'</td><td>'.$row['Type'].'</td><td>'.$row['Brand'].'</td><td>'.$row['Model'].'</td><td>'.$row['Size'].'</td><td>'.$row['Skis/Snowboards'].'</td><td>'.$row['PurchaseHistory_idPurchaseHistory'].'</td><td>'.$row['Bindings_idBindings'].'</td><td>'.$row['Cost'].'</td></tr>';
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