JSONArray data;

int diameter = 25;
int padding = 35;

void setup() {
  data = loadJSONArray("robford.json");
  size(385, 435);

  textSize(14);
  textLeading(14*1.3);
  noStroke();
  background(#435465);

  for (int i = 0; i < data.size(); i++) {
    JSONObject tweet = data.getJSONObject(i);

    fill(color(255, map(tweet.getInt("retweet_count"), 0, 20, 50, 255)));
    ellipse(padding + (i % 10 * padding), padding + (i / 10 * padding) , diameter, diameter);
  }

  fill(255);
  rect(0, 385, width, height);
}

void draw() {
  int index = ((mouseX - padding / 2) / padding) + ((mouseY - padding) / padding * 10);
  JSONObject tweet = data.getJSONObject(constrain(index, 0, data.size() - 1 ));

  fill(255);
  rect(0, 385, width, height);

  fill(0);
  text(tweet.getString("text"), 10, 390, width - 20, 40);
}
