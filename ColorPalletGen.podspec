Pod::Spec.new do |s|
  s.name         = 'ColorPalletGen'
  s.version      = '0.1.0'
  s.summary      = 'Generate .clr file using some files'
  s.homepage     = 'https://github.com/tomokitakahashi/ColorPalletGen'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Tomoki Takahashi' => 'tom_aaa_0905@yahoo.co.jp' }
  s.source       = { http: "#{s.homepage}/releases/download/#{s.version}/ColorPalletGen.zip" }
  s.preserve_paths = '*'
  s.exclude_files = "**/file.zip"
end