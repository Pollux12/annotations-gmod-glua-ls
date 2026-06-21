import fs from 'fs';
import path from 'path';

describe('release-gluals workflow', () => {
  const workflow = fs.readFileSync(path.join(process.cwd(), '.github/workflows/release-gluals.yml'), 'utf8');
  const testsWorkflow = fs.readFileSync(path.join(process.cwd(), '.github/workflows/tests.yml'), 'utf8');

  test('does not keep the old test-plugin release workflow', () => {
    expect(fs.existsSync(path.join(process.cwd(), '.github/workflows/release-test.yml'))).toBe(false);
  });

  test('runs tests on both production source branches', () => {
    expect(testsWorkflow).toContain('- main');
    expect(testsWorkflow).toContain('- beta');
  });

  test('publishes stable and prerelease from separate source branches', () => {
    expect(workflow).toContain('source_branch: main');
    expect(workflow).toContain('publish_base_branch: gluals-annotations');
    expect(workflow).toContain('plugin_branch_prefix: gluals-annotations-plugin-');
    expect(workflow).toContain('source_branch: beta');
    expect(workflow).toContain('publish_base_branch: gluals-annotations-prerelease');
    expect(workflow).toContain('plugin_branch_prefix: gluals-annotations-prerelease-plugin-');
  });

  test('uses supported generate-lua CLI flags', () => {
    expect(workflow).toContain('--custom-overrides ./custom');
    expect(workflow).not.toContain('--customOverrides');
    expect(workflow).not.toContain('--wipeLua');
  });

  test('bootstraps generation when the publish branch is missing', () => {
    expect(workflow).toContain('PUBLISH_BASE_BRANCH: ${{ matrix.publish_base_branch }}');
    expect(workflow).toContain('Publish branch');
    expect(workflow).toContain('does not exist yet -> generate all to bootstrap release stream');
  });

  test('cleans generated worktree changes before switching to publish branches', () => {
    expect(workflow).toContain('git reset --hard');
    expect(workflow).toContain('git checkout --force -B "$branch_name"');
  });
});
