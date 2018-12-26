<?php include("backend/functions.php"); ?>

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
                <h4 class="modal-title"><b>View Incident Details</b></h4>
            </div>
            <div class="modal-body">

              <center><?php echo(getIncidentInfo("Details", $_GET["incident"])); ?>

                <br><br>
                <a href="cad_edit_type.php?incident=<?php echo($_GET["incident"]); ?>">Edit Incident Type</a><br>
                <a href="cad_edit_channel.php?incident=<?php echo($_GET["incident"]); ?>">Edit Incident Channel</a><br>
                <a href="cad_edit_location.php?incident=<?php echo($_GET["incident"]); ?>">Edit Incident Location</a><br>
                <a href="cad_edit_grade.php?incident=<?php echo($_GET["incident"]); ?>">Edit Incident Grade</a><br><br>
                <a href="javascript:addnote(<?php echo($_GET["incident"]); ?>)">Add Incident Note</a>
              </center><br>

              <table class="table table-advanced table-striped table-hover">
              	<thead>
              		<th>Time</th>
              		<th>Log</th>
              		<th>User</th>
              		<th>Source</th>
              	</thead>
              	<tbody>
              		<?php

              		$conn = getConnection();

              		$res = $conn->query("SELECT * FROM IncidentLogs WHERE Incident='".$_GET["incident"]."'");

              		if ($res->num_rows > 0) {

              			while ($r = $res->fetch_assoc()) {

              				echo("<tr><td>".$r["Time"]."</td><td>".$r["Log"]."</td><td>".$r["User"]."</td><td>".$r["Source"]."</td></tr>");              				

              			}

              		}

              		 ?>
              	</tbody>
              </table>


            <div class="modal-footer">
                <button type="button" class="btn default" onclick="window.close();">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <script>
  	function addnote(incident) {

  		var url = "cad_addnote.php?incident=" + incident;
    	var w = 700;
    	var h = 350;
   		var left = Number((screen.width/2)-(w/2));
    	var tops = Number((screen.height/2)-(h/2));
    	window.open(url, '_blank', 'toolbar=no, scrollbars=no, resizable=yes, titlebar=no, width='+w+', height='+h+', top='+tops+', left='+left);
    	window.close();

  	}
  </script>
</body>

</html>
