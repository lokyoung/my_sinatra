require 'sinatra'

['/one', '/two', '/three'].each do |route|
  get route do
	"get #{route}"
  end

  post route do
	"post #{route}"
  end

  put route do
	"put #{route}"
  end

  delete route do
	"delete #{route}"
  end

  patch route do
	"patch #{route}"
  end

end

