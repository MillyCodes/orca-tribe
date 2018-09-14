console.log("Is this Search?")

$("#blogpost-table").hide();
$("#search-results").html("<%= escape_javascript(render :partial => 'results') %>");
