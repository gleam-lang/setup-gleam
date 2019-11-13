const { exec } = require("@actions/exec");
const path = require("path");
const semver = require("semver");

module.exports = { installGleam, installOTP };

/**
 * Install Gleam.
 *
 * @param {string} version
 * @param {string} arch
 */
async function installGleam(version) {
  if (process.platform === "linux") {
    await exec(path.join(__dirname, "install-gleam-ubuntu"), [version]);
    return;
  }

  throw new Error(
    "@actions/setup-gleam only supports Ubuntu Linux at this time"
  );
}

/**
 * Install OTP.
 *
 * @param {string} version
 */
async function installOTP(version) {
  if (process.platform === "linux") {
    await exec(path.join(__dirname, "install-otp-ubuntu"), [version]);
    return;
  }

  throw new Error(
    "@actions/setup-gleam only supports Ubuntu Linux at this time"
  );
}
