set dotenv-load := true

info:
    @echo docker tag, $dockertag
    @echo twurl
    @echo $twurl | base64 -d
    @echo twittername, $twittername

run:
    docker build -t $dockertag .
    docker run -d --restart=always --name=scroll \
        -v /mnt/d/scroll-out/:/out \
        $dockertag \
        sh -c "echo $twurl | base64 -d > ~/.twurlrc; ./scroll -u $twittername -loop 0 -o /out"
