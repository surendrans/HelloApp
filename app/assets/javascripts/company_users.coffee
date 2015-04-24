# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@CompanyUser =
  searchUser: () ->
   userEmail = $('.user_email').val()
   $.get("/company_users/search_user?email=" + userEmail).done (data) ->
    compiled = Handlebars.compile($("#user_info").html());
    $("#user_info_container").html(compiled({user: data.user, email: userEmail}))
    return
  inviteUser: (type, value) ->
    $.post("/company_users/invite", {type: value}).done (data) ->
      compiled = Handlebars.compile($("#user_info").html());
      $("#user_info_container").html(compiled({user: data.user}))

$(document).ready ->
  $('.invite').on 'click', ->
    alert "alert"