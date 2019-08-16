sudo npm install -g elm elm-test elm-format --unsafe-perm

git clone git@github.com:elm-tooling/elm-language-server.git
cd elm-language-server

npm install
npm run compile
sudo npm link
