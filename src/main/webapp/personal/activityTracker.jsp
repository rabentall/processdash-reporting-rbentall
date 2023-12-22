<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>
<title>Activity Tracker</title>

<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/4.3.0/css/fixedColumns.dataTables.min.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/fixedcolumns/4.3.0/js/dataTables.fixedColumns.min.js"></script>

<script src="./../script/activityTracker.js" ></script>
<link   href="./../style/master.css" rel="stylesheet" />


<!-- WIP - STYLING TO GET IT TO LOOK OK:

1. Question of column widths - do we redo each time we add/remove cols?
2. position of search boxes - px or percent?
3. Page number position?
3. table container size?

-->

<style>


/* WIP... not ready yet. */
#notesPanel{
  position: fixed; /* Stays fixed relative to viewport*/
  border-style: solid;
  border-color: rgb(11,65,145); /*BLUE */
  border-width: 1px;
  background-color: rgba(210, 222, 241); /* light grey */   
  margin:0px 0px 15px 00px;
  visibility: hidden;
  left: 200px;
  top: 400px;
  width: 600px;
  height: 200px;
  z-index: 1;
}

#currentTask
{
    /* font-weight: bold; */
    color:  rgb(11,65,145); 
    text-align: left;

      
}

.active {
    
  /* Important means that we color the whole row. otherwise the fixed columns stay white. */
  background: rgb(255, 215, 0) !important; 
}

.paused {
  /* Important means that we color the whole row. otherwise the fixed columns stay white. */

  background: rgb(255, 246, 204) !important;
}

/* .sorting dtfc-fixed-left{
 
} */

  
  </style>
</head>

<script>
//
// Document ready handler:
//
$(document).ready(() =>
{
  initTaskListTable();
});

</script>

<body onkeyup="shortcutEventHandler(event);">

<h3  class="h3Content" >Activity Tracker</h3>
<div class="contentBody">

  <!-- <h4>Current task</h4>
  <div id="currentTask" >None</div> -->
  <!-- <table id="currentTaskTable" class="display compact nowrap hover cell-border"  >
    <thead>
    <tr><td>Measure</td><td>value</td></tr>
  </thead>
  <tbody>
    <tr><td>PlanItem</td><td>TODO</td></tr>
    <tr><td>PlanHrs</td><td>TODO</td></tr>
    <tr><td>ActualHrs</td><td>TODO</td></tr>
    </tbody>
  </table> -->

  <!-- TODO - NEEDS TO BE BASED ON A LISTENER... -->
  <!-- <div id="currentTaskContainer" >
    
    <div id="currentTaskPlan" >10</div>
    <div id="currentTaskAct">20</div>
    <div id="componentTotal"></div> 

  </div> -->

  <h4>Current task</h4>  

  <!-- TODO - text for Stopped/paused/running -->
  <div id="currentTask" >Stopped</div>

  <h4>Direct time tasks</h4>

  <!-- Checkboxes to show/hide rows in task table: -->
  <div id="showCompletedTasksBox" class="checkBoxFormat">
    <h4 class="checkBoxTitleFormat">Rows</h4>
    <label for="cbShowCompleted">Completed:</label>
    <input type="checkbox" id="cbShowCompleted" onclick="toggleTaskStatus()" />
    <label for="cbShowTodo">Todo:</label>
    <input type="checkbox" id="cbShowTodo" onclick="toggleTaskStatus()" />
    <label for="cbShowWip">WIP:</label>
    <input type="checkbox" id="cbShowWip" onclick="toggleTaskStatus()" />  
  </div>
  <!-- Checkboxes to show/hide columns in task table: -->  
  <div   id="showColumnsBox" class="checkBoxFormat">
    <h4 class="checkBoxTitleFormat">Columns</h4>    
    <label for="cbShowDates">Dates:</label>
    <input type="checkbox" id="cbShowDates" onclick="toggleColumnStatus()" />
    <label for="cbShowHours">Hours:</label>
    <input type="checkbox" id="cbShowHours" onclick="toggleColumnStatus()" />
    <label for="cbShowLabels">Labels:</label>
    <input type="checkbox" id="cbShowLabels" onclick="toggleColumnStatus()" />
  </div>

<!-- TODO - CHECK OPTIONS CORRECT -->

  <!-- https://datatables.net/examples/styling/display.html
  
  stripe hover order-column row-border
  
  
  display   hover  
  -->
  <table id="timerTable" class="nowrap  hover row-border compact cell-border"  ></table>
  <div   id="pageLoader" class="loader"></div>
  <div   id="notesPanel" onclick="hideNotesPanel()"></div>


  <h4>Overhead tasks</h4>
  <!-- TODO - overhead table -->
  <div id="overheadTasks" class="overheadTasks" >
    <button type="button" onclick="btn_Click('/LUK/OH/Admin')">Admin</button>
    <button type="button" onclick="btn_Click('/EXT/Lunch')">Lunch</button>
  </div>

</div>
</body>
</html>