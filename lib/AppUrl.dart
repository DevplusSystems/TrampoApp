class AppUrl {
  static const String baseUrl = "https://reqres.in";
  static const String listUrl = "$baseUrl/api/login";

  static const String recipeBaseUrl = "https://stallionengg.com/technospart_recipe";
  static const String categoryList = "$recipeBaseUrl/urdurecepies_categories.php";

  // https://stallionengg.com/technospart_recipe/new_urdu_recepies.php // updated category list
  static const String allRecipeList = "$recipeBaseUrl/recepies_topics.php?id=0" ;// all recipe list if call without id =0 , if specific then id=cat_id

  static const String specificRecipeDetail = "$recipeBaseUrl/urdurecepies_specific_category.php" ; // post api params Cat_Id =1
}
