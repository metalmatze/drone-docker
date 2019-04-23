local drone = import 'drone.libsonnet';

[
  drone.pipeline.linux {
    name: 'testing',

    steps: [
      drone.steps.golang {
        name: 'vet',
        commands: ['go vet ./...'],
      },
      drone.steps.golang {
        name: 'test',
        commands: ['go test -cover ./...'],
      },
    ],
  },

  drone.pipeline.linux {
    name: 'foobarLinux',
    steps: [
      drone.steps.base,
      drone.steps.golang,
    ],
  },
  drone.pipeline.linuxARM64 {
    name: 'foobarLinuxARM64',
    steps: [
      drone.steps.golang {
        image: 'golang:arm',
      },
    ],
  },
  drone.pipeline.windows {
    name: 'foobarWindows',
  },
]

// [
//   pipeline.test('linux', 'amd64'),

//   pipeline.build('docker', 'linux', 'amd64'),
//   pipeline.build('docker', 'linux', 'arm64'),
//   pipeline.build('docker', 'linux', 'arm'),
//   pipeline.notifications('docker', depends_on=[
//     'linux-amd64',
//     'linux-arm64',
//     'linux-arm',
//   ]),

//   pipeline.build('gcr', 'linux', 'amd64'),
//   pipeline.build('gcr', 'linux', 'arm64'),
//   pipeline.build('gcr', 'linux', 'arm'),
//   pipeline.notifications('gcr', depends_on=[
//     'linux-amd64',
//     'linux-arm64',
//     'linux-arm',
//   ]),

//   pipeline.build('acr', 'linux', 'amd64'),
//   pipeline.build('acr', 'linux', 'arm64'),
//   pipeline.build('acr', 'linux', 'arm'),
//   pipeline.notifications('acr', depends_on=[
//     'linux-amd64',
//     'linux-arm64',
//     'linux-arm',
//   ]),

//   pipeline.build('ecr', 'linux', 'amd64'),
//   pipeline.build('ecr', 'linux', 'arm64'),
//   pipeline.build('ecr', 'linux', 'arm'),
//   pipeline.notifications('ecr', depends_on=[
//     'linux-amd64',
//     'linux-arm64',
//     'linux-arm',
//   ]),

//   pipeline.build('heroku', 'linux', 'amd64'),
//   pipeline.build('heroku', 'linux', 'arm64'),
//   pipeline.build('heroku', 'linux', 'arm'),
//   pipeline.notifications('heroku', depends_on=[
//     'linux-amd64',
//     'linux-arm64',
//     'linux-arm',
//   ]),
// ]



