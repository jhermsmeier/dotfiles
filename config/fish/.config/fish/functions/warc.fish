function warc
  wget \
    --recursive \
    --no-clobber \
    --page-requisites \
    --html-extension \
    --convert-links \
    --domains $argv[1] \
    --no-parent \
      'https://'$argv[1]
end