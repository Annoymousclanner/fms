<?php

include("backend.php");

echo(var_dump(getConnection()->ping()));
getConnection()->query("INSERT INTO users (FirstName, LastName, Username, CollarNumber, Division, Controller, ShortRank, JoinDate, Password) VALUES ('Adam','Bye','ABye',
  'CW999','TP','1','SUPT', now(), '".password_hash("changeme", PASSWORD_DEFAULT)."')");

?>
