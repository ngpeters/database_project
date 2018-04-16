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
        <h1 style="color:#696969;">Jakes Ski Rentals Bindings</h1>
        <hr>
            <p style="color:#696969;">The current inventory of Jakes Ski Rentals is:</p>
        <?php
            
            /*** mysql hostname ***/
            $hostname = 'localhost';
            $username = 'npeters' ;
            $password = 'newword' ;
            
            
            try {
                $dbh = new PDO("mysql:host=$hostname;dbname=ski_rental_inventory", $username, $password);
                /*** The SQL SELECT statement ***/
                $select ='SELECT * FROM Bindings WHERE Location_idLocation="JakesSkiRentals"';
                $sql = $select;
                echo '<table><tr><th>Bindings id</th><th>Size</th><th>Brand</th><th>Cost</th><th>Age</th><th>Model</th></tr>';
                foreach ($dbh->query($sql) as $row)
                {
                    echo '<tr><td>'.$row['idBindings'].'</td><td>'.$row['Size'].'</td><td>'.$row['Brand'].'</td><td>'.$row['Cost'].'</td><td>'.$row['Age'].'</td><td>'.$row['Model'].'</td></tr>';
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
