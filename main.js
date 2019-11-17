const { exec } = require("@actions/exec");
const core = require("@actions/core");

const version = core.getInput("gleam-version", { required: true });
exec(`./main.sh ${version}`).catch(err => core.setFailed(err.message));
