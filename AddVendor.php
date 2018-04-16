<html>
    <body style="background-color:#B0C4DE;">
        <h1 style="color:#696969;">Add Vendor</h1>
        <hr>

<?php
    /*** mysql hostname ***/
    $hostname = 'localhost';
    $username = 'npeters' ;
    $password = 'newword' ;
    
    $idVendor = $BrandName = $BuyerSeller = "";
    $nameErr = "";
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (empty($_POST["BrandName"])) {
            $nameErr = "Brand Name is required";
        } else {
            $BrandName = trim($_POST["BrandName"]);
        }
        $BuyerSeller = ($_POST["BuyerSeller"]);
        
        try {
            $dbh = new PDO("mysql:host=$hostname;dbname=ski_rental_inventory", $username, $password);
            
            /*** The SQL INSERT statement ***/
            $result = $dbh->query('SELECT MAX(idVendor) from Vendor');
            $row=$result->fetch_assoc();
            $idVendor = (int) $row['idVendor'];
            $idVendor = $idVendor + 1;
            
            $insert ='INSERT INTO Vendor VALUES ($idVendor, $BrandName, $BuyerSeller)';
            $dbh->query($insert);
            /*** close the database connection ***/
            $dbh = null;
            
        }
        catch(PDOException $e){
            echo $e->getMessage();
        }
    }
    ?>

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
            Brand Name: <span class="error">* <?php echo $nameErr;?></span> </br>
            <INPUT TYPE="Text" NAME="BrandName">
                </br>
                Buyer/Seller: <br>
            <INPUT TYPE="radio" name="BuyerSeller" value="Buyer" checked> Buyer<br>
            <INPUT TYPE="radio" name="BuyerSeller" value="Seller"> Seller <br>
            <INPUT TYPE="Submit" VALUE="Enter">
        </FORM>
        

    </body>
    <style type="text/css">
        .GeneralB {
            margin: 50px;
            background-color: #696969; /* light gray */
            border: none;
            color: #F0F8FF;
            padding: 50px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 28px;
        }
    </style>
</html>
