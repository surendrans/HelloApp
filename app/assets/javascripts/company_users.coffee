# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@CompanyUser =
  searchUser: () ->
   alert "asd"
   userEmail = $('.user_email').val()
   $.get("/company_users/search_user?email=" + userEmail).done (data) ->
    compiled = Handlebars.compile($("#user_info").html());
    $("#user_info_container").html(compiled({user: data.user, email: userEmail}))
    return
  inviteUser: (type, value) ->
    poc = $('.poc').val()
    reason = $('.reason').val()
    data =  { type: type, value: value, poc: poc, reason: reason }
    console.log data
    $.post("/company_users/invite", data).done (data) ->
      $("#user_info_container").html("")

$(document).ready ->
  $('.invite').on 'click', ->
    alert "alert"