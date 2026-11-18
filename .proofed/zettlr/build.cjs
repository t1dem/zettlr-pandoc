const path = require('node:path');
const fs = require('node:fs/promises');
const { createRequire } = require('node:module');

const project = process.cwd();
const requireProject = createRequire(path.join(project, 'package.json'));
const loadForgeConfig = requireProject('@electron-forge/core/dist/util/forge-config').default;
const { getHookListrTasks } = requireProject('@electron-forge/core/dist/util/hook');
const { Listr } = requireProject('listr2');

// Use Forge's production bundle hooks without its signing and packaging stage.
const runWithoutTrace = (_metadata, run) => (...args) => run(runWithoutTrace, ...args);

async function build() {
  const config = await loadForgeConfig(project);
  for (const hook of ['generateAssets', 'prePackage']) {
    const tasks = await getHookListrTasks(
      runWithoutTrace, config, hook, process.platform, process.arch
    );
    await new Listr(tasks, { renderer: 'verbose' }).run();
  }

  const webpack = path.join(project, '.webpack');
  for (const directory of ['main', 'renderer']) {
    await fs.rename(path.join(webpack, process.arch, directory), path.join(webpack, directory));
  }
}

build().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
