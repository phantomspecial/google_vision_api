# frozen_string_literal: true

require 'pry'
require 'dotenv'
require 'google-cloud-vision'

Dotenv.load

image_annotator = Google::Cloud::Vision.image_annotator
image_path = 'driver_license.jpg'

response = image_annotator.text_detection(
    image:       image_path,
    max_results: 1, # optional, defaults to 10
    image_context: {language_hints: [:ja]}
)

response.responses.each do |res|
  res.text_annotations.each do |text|
    puts text.description
  end
end
