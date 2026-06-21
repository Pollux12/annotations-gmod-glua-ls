import fs from 'fs';
import path from 'path';

describe('release-gluals workflow', () => {
  const workflow = fs.readFileSync(path.join(process.cwd(), '.github/workflows/release-gluals.yml'), 'utf8');

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
