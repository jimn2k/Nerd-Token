const NerdToken = artifacts.require('NerdToken')

module.exports = (deployer) => {
    deployer.deploy(NerdToken)
}