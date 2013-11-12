JSONArray data = loadJSONArray("robford.json");

for (int i = 0; i < data.size(); i++) {
  JSONObject tweet = data.getJSONObject(i);
  
  println(tweet.getString("text"));
}
