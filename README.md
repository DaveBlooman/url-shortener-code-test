URL Shortener
===================

### Install
```sh
gem install bundler
bundle install
```

### Running
```sh
rackup
```

### Usage
Web:  
Visit in web browser [http://localhost:9292](http://localhost:9292)

API:

```sh
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{"url": "https://www.farmdrop.com/"}' "http://localhost:9292/url"
```

```json
{
  "short_url": "tzXd5983",
  "long_url": "https://www.farmdrop.com/"
}
```
Will return an short_url ID for usage with root of host, if running locally, [http://localhost:9292](http://localhost:9292) + ID

### Tests

Run on command line
```sh
rspec
```
