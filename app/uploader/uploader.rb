class AvatarUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	storage :file

	process resize_to_fit: [400, 400]

	version :thumb do
		process resize_to_fill: [200, 150]
	end

	def store_dir
		'public/uploads'
	end

end
