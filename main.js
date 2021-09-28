const { exec } = require("@actions/exec");
const core = require("@actions/core");
const path = require("path");

const version = core.getInput("gleam-version", { required: true });
const cacheUrl = core.getInput("gleam-cache");
if (cacheUrl) {
  const binaryUrl = cacheUrl.replace('VERSION', version);
  const cache = path.join(__dirname, "cache.sh");
  exec(cache, [binaryUrl]).catch(err => core.setFailed(err.message));
} else {
  const asdf = path.join(__dirname, "asdf.sh");
  exec(asdf, [version]).catch(err => core.setFailed(err.message));
}
