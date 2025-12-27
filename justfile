default: render

clean:
    rm -fr _book _site scrap_cache .quarto .RData .Rhistory data

docker-build:
    docker build . -t ot

render: clean docker-build
    docker run --rm -v .:/project ot
