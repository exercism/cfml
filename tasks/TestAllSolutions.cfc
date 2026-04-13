/**
 * I test all the example solutions to make sure they all pass.
 */
component {

    function run() {
        // grab concept and practice exercises
        var exercisesRoot = expandPath(getDirectoryFromPath(getCurrentTemplatePath()) & '../exercises');
        var exercises = [];
        for (var exerciseType in ['practice', 'concept']) {
            var exerciseDir = exercisesRoot & '/' & exerciseType;
            if (directoryExists(exerciseDir)) {
                exercises.append(
                    directoryList(
                        exerciseDir,
                        false,
                        'path',
                        '',
                        'name',
                        'dir'
                    ),
                    true
                );
            }
        }
        var exitCode = 0;
        var count = 0;

        for (var path in exercises) {
            if (!fileExists(path & '/TestRunner.cfc') || !fileExists(path & '/.meta/config.json')) {
                continue;
            }

            var slug = listLast(path, '/\');
            var pascalSlug = slug
                .listToArray('-')
                .map(function(w) {
                    return w.left(1).uCase() & w.mid(2, w.len());
                })
                .toList('');
            var stub = path & '/' & pascalSlug & '.cfc';
            var example = path & '/.meta/Example.cfc';
            var backup = fileRead(stub);
            fileCopy(example, stub);

            print.line('#slug# - running').toConsole();

            // suppress output for passing tests
            var passed = false;
            try {
                command('task run')
                    .params('TestRunner')
                    .inWorkingDirectory(path)
                    .run(returnOutput = true);
                passed = true;
            } catch (any e) {
                passed = false;
            }

            fileWrite(stub, backup);

            count++;

            if (passed) {
                print.line('#slug# - passed').toConsole();
            } else {
                // rerun without capture to get failing output
                command('task run')
                    .params('TestRunner')
                    .inWorkingDirectory(path)
                    .run();
                exitCode = 1;
                break;
            }
        }

        print.line('Test suites run: #count#');

        setExitCode(exitCode);
    }

}
