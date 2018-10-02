jQuery(document).ready(function() {
  $('#users-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#users-datatable').data('source'),
    "pagingType": "numbers",
    "columns": [
      {"data": "id"},
      {"data": "name"},
      {"data": "email"},
      {"data": "sign_in_count"},
      {"data": "last_sign_in_at"},
      {"data": "last_sign_in_ip"},
      {"data": "role"}
    ]
  });
});
