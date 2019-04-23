{
  _config+:: {
    golang+: {
      image: 'golang:1.11',
    },
  },

  pipeline: {
    base+:: {
      kind: 'pipeline',
      name: 'name',
      platform: {
        os: 'linux',
        arch: 'amd64',
      },
      steps: [],
    },

    linux+: self.base,

    linuxARM+: self.linux {
      platform+: {
        arch: 'arm',
      },
    },

    linuxARM64+: self.linuxARM {
      platform+: {
        arch: 'arm64',
      },
    },

    windows+: self.base {
      platform+: {
        os: 'windows',
        arch: 'amd64',
      },
    },
  },

  steps: {
    base+:: {
      name: 'base',
      image: 'base',
      commands: [
        'echo base',
      ],
    },

    golang+: self.base {
      name: 'go',
      image: 'golang:1.12',
      pull: 'always',
      environment: {
        GO111MODULE: 'on',
      },
      commands: [
        'go env',
      ],
    },
  },
}
