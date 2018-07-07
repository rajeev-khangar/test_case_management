$(document).on("ready page:load turbolinks:load", function(){
  $("#moduleSelect").on("change",function(){
  	project_module_id = $(this).val();
  	$.ajax({
      type: "get",
      url: "/milestones/"+ $(this).attr("data-milestoneId") +"/milestone_cases",
      data: {"project_module_id": project_module_id},
      dataType: "script",
      success: function (data) {
      },
      error: function () {
      }
    });
  })
})