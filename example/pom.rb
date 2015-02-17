project 'gem with jar' do

  model_version '4.0.0'
  id 'rubygems:example:2'
  packaging 'gem'

  description 'gem with empty jar and jar dependencies'

  developer do
    name 'example person'
    email 'mail@example.com'
  end

  repository( :id => 'rubygems-releases',
              :url => 'http://rubygems-proxy.torquebox.org/releases' )

  properties( 'jruby.plugins.version' => '1.0.8', :gemspec => 'example.gemspec' )

  gem 'rubygems:jar-dependencies:[0.0.6,0.0.99999]'
  gem( 'rubygems:rspec:[2.14.0,2.14.99999]',
       :scope => 'test' )
  gem( 'rubygems:rake:[10.3.2,10.3.99999]',
       :scope => 'test' )
  jar 'org.bouncycastle:bcpkix-jdk15on:1.49'
  jar 'org.bouncycastle:bcprov-jdk15on:1.49'

  plugin( 'de.saumya.mojo:gem-maven-plugin:${jruby.plugins.version}' )

  build do
    directory '${basedir}/pkg'
    extension 'de.saumya.mojo:gem-with-jar-extension:${jruby.plugins.version}'
  end

end
