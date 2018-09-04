<!-- <p>Posted by: <%= link_to park.user.name, user_path(park.user) %> </p> -->


<h3>Posted by: <%= link_to trail.user.name, user_path(trail.user) %></h3>

-Add next/prev buttons to parks/show
-render in trail list

 <a href="#" class="js-view-trails btn btn-primary btn-lg" data_id="<%= @park.id %>"> View Trail </a>
 <div class="container" style="width:80%;">
  <div class="parksTrails">
  </div>
  </div>