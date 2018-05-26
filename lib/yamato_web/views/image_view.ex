defmodule YamatoWeb.ImageView do
  use YamatoWeb, :view

  def image_permalink(image, size \\ :original) do
    Path.join([
      YamatoWeb.Endpoint.url(),
      Yamato.ArticleImageUploader.url({image.image, image}, size)
    ])
  end
end
