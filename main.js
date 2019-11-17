const { exec } = require("@actions/exec");
const core = require("@actions/core");

exec("./main.sh").catch(err => core.setFailed(err.message));
