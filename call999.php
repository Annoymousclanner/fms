<?php

include("backend/functions.php");

if (isset($_POST["type"])) {

  $status = isset($_POST["create"]) ? "Open" : "999";

  getConnection()->query("INSERT INTO Incidents (Type, Details, Grade, Channel, Status, Location, Borough)
  VALUES ('".$_POST["type"]."','".$_POST["details"]."','".$_POST["grade"]."','".$_POST["channel"]."','".$status."', '".$_POST["location"]."','".$_POST["borough"]."')");
  echo("<script>window.close();</script>");

}

 ?>

<html>
<head>
  <meta charset="utf-8">
  <title>uFMS ~ Unofficial FMS</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <!-- BEGIN LAYOUT FIRST STYLES -->
  <link href="//fonts.googleapis.com/css?family=Oswald:400,300,700" rel="stylesheet" type="text/css">
  <!-- END LAYOUT FIRST STYLES -->
  <!-- BEGIN GLOBAL MANDATORY STYLES -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css">
  <link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">
  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <link href="../assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/global/plugins/morris/morris.css" rel="stylesheet" type="text/css">
  <link href="../assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css">
  <!-- END PAGE LEVEL PLUGINS -->
  <!-- BEGIN THEME GLOBAL STYLES -->
  <link href="../assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css">
  <link href="../assets/global/css/plugins.min.css" rel="stylesheet" type="text/css">
  <!-- END THEME GLOBAL STYLES -->
  <!-- BEGIN THEME LAYOUT STYLES -->
  <link href="../assets/layouts/layout4/css/layout.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/layouts/layout4/css/custom.min.css" rel="stylesheet" type="text/css">
  <!-- END THEME LAYOUT STYLES -->
  <link rel="shortcut icon" href="favicon.ico">
</head>

<body>
  <div class="modal fade in" id="full" tabindex="-1" role="dialog" aria-hidden="true" style="display: block;">
    <div class="modal-dialog modal-full">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                  <?php

                  function getOption($channel) {

            $conn = getConnection();
  $res = $conn->query("SELECT IncidentID FROM Incidents WHERE Channel='".$channel."' AND Status='Open'");
  if ($res->num_rows > 0) {

    return "<option disabled>" . $channel . "</option>";

  } else {

    return "<option>" . $channel . "</option>";

  }

}

                  if (isset($_GET["create"])) {

                    echo("<b>Create Incident</b>");

                  } else {

                    echo("<b>Call 999</b>");

                  }

                   ?>
                </h4>
            </div>
            <div class="modal-body">

              <form method="post" action="call999.php">
              <?php if (isset($_GET["create"])) { echo('<input type="hidden" name="create" value="true">'); } ?>

              <input class="form-control" name="type" placeholder="Type"><br>
              <input class="form-control" name="location" placeholder="Street Name"><br>
              <input name="borough" placeholder="Postcode" class="form-control"><br>
              <textarea name="details" class="form-control" placeholder="Details"></textarea><br>
              <select <?php if (!isset($_GET["create"])) { echo 'style="display:none;" value=""'; } ?> name="grade" class="form-control">
                <?php if (!isset($_GET["create"])) { echo '<option>Unset</option>'; } ?>
                <option>Grade 1</option>
                <option>Grade 2</option>
                <option>Grade 3</option>
                <option>Grade 4</option>
              </select><br>
              <select <?php if (!isset($_GET["create"])) { echo 'style="display:none;"'; } ?> class="form-control" name="channel">
                <?php
                echo(getOption("INC 1"));
                echo(getOption("INC 2"));
                echo(getOption("INC 3"));
                echo(getOption("INC 4"));
                echo(getOption("INC 5"));
                echo(getOption("INC 6"));
                echo(getOption("INTOP 1"));
                echo(getOption("INTOP 2"));
                 ?>
              </select>

            </div>

            <div class="modal-footer">
                <button type="submit" class="btn red"><?php if (isset($_GET["create"])) {echo("Create Incident");} else {echo("Call 999");} ?></button>
              </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</body>

</html>
