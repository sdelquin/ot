default: render

clean:
    rm -fr _book _site scrap_cache .quarto .RData .Rhistory

docker-build:
    docker build . -t ot

render: clean docker-build
    mkdir -p data
    docker run --rm -v .:/book ot
    cp -r data _book/
