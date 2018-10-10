App.sync = App.cable.subscriptions.create("NotificationsChannel", {
  received: function(data) {
    if($(data.id).length) {
      $(data.id)[0].outerHTML = data.html
    }
  }
});
