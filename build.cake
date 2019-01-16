#tool "nuget:?package=xunit.runner.console"
#tool "nuget:?package=OctopusTools"
#tool "nuget:?package=MSBuild.SonarQube.Runner.Tool"
#tool "nuget:?package=OpenCover"


#addin "nuget:?package=Cake.Sonar"

var target        = Argument("target", "Default");
var configuration = Argument("configuration", "Release");
var releaseNumber = Argument("releaseNumber", "");
var solution      = Argument<string>("solution", "");

var solutionPath             = solution + ".sln";
var buildDirs                = "./**/bin/" + configuration;
var nugetOutputDir           = "./artifacts";
var octopusDeployProjectName = "AI." + solution;
var octopusDeployServer      = "http://10.120.120.11:8082";
var octopusDeployApiKey      = "API-MBFQMNHSNQE2OQHPSBIQH3MKEY";
var sonar = new {
  Url      = "http://localhost:9000",
  Login    = "admin",
  Password = "admin",
  Key      = "ConsoleApp2",
};

Task("Clean")
  .Does(() => {
    EnsureDirectoryExists(nugetOutputDir);
    CleanDirectories(buildDirs);
    CleanDirectories(nugetOutputDir);
  });

Task("NuGetRestore")
  .Does(() => NuGetRestore(solutionPath));

Task("Build")
  .IsDependentOn("Clean")
  .IsDependentOn("NuGetRestore")
  .Does(() => {
    var msBuildSettings = new MSBuildSettings()
      .SetConfiguration(configuration)
      .WithProperty("RunOctoPack", "true")
      .WithProperty("OctoPackEnforceAddingFiles", "true")
      .WithProperty("OctoPackPackageVersion", releaseNumber)
      .WithProperty("OctoPackNuGetProperties", "Configuration=" + configuration)
      .WithProperty("ToolVersion","MSBuildToolVersion.VS2017");

    MSBuild(solutionPath, msBuildSettings);

    CopyFiles(GetFiles("./**/octopacked/*.nupkg"), nugetOutputDir);
  });

Task("RunUnitTests")
  .Does(() => {	
	Console.WriteLine(buildDirs + "/*Test.dll");
	OpenCover(i => 
		{
		i.NUnit3(buildDirs + "/*Test.dll");
		}, 
		new FilePath("./Coverage.xml"),
		new OpenCoverSettings()
	);
  });

Task("NuGetPush")
  .WithCriteria(HasArgument("releaseNumber"))
  .Does(() => {
    var packages = GetFiles(nugetOutputDir + "/*.nupkg").ToList();
    var nuGetPushSettings = new NuGetPushSettings {
      Source = octopusDeployServer + "/nuget/packages",
      ApiKey = octopusDeployApiKey,
    };
    NuGetPush(packages, nuGetPushSettings);
  });

Task("OctoCreateRelease")
  .WithCriteria(HasArgument("releaseNumber"))
  .Does(() => {
    var createReleaseSettings = new CreateReleaseSettings {
      Server = octopusDeployServer,
      ApiKey = octopusDeployApiKey,
      PackagesFolder = nugetOutputDir,
      ReleaseNumber = releaseNumber,
    };
    OctoCreateRelease(octopusDeployProjectName, createReleaseSettings);
  });

Task("Default")
  .IsDependentOn("SonarBegin")
  .IsDependentOn("Build")
  .IsDependentOn("RunUnitTests")
  .IsDependentOn("SonarEnd");

Task("PrepareDeploy")
  .IsDependentOn("Default")
  .IsDependentOn("NuGetPush")
  .IsDependentOn("OctoCreateRelease");
  
Task("PushAndRelease")
  .IsDependentOn("NuGetPush")
  .IsDependentOn("OctoCreateRelease");
   
Task("SonarBegin")
  .Does(() => {     
      SonarBegin(new SonarBeginSettings {
        Url = sonar.Url, 
        Login = sonar.Login,
        Password = sonar.Password, 
        Key = sonar.Key,
		NUnitReportsPath = "TestResult.xml",
		OpenCoverReportsPath = "Coverage.xml",
		Verbose = true
      });
  });

  Task("SonarEnd")
    .Does(() => { 
        SonarEnd(new SonarEndSettings {
          Login = sonar.Login,
          Password = sonar.Password,
        });
    });
  

RunTarget(target);
