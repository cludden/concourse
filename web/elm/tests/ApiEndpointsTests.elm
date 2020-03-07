module ApiEndpointsTests exposing (all)

import Api.Endpoints exposing (Endpoint(..), toPath)
import Concourse.Pagination as Pagination
import Expect
import Test exposing (Test, describe, test)


all : Test
all =
    describe "ApiEndpoints"
        [ test "Job" <|
            \_ ->
                Job
                    { jobName = "job"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "jobs", "job" ]
        , test "Jobs" <|
            \_ ->
                Jobs
                    { pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "jobs" ]
        , test "AllJobs" <|
            \_ ->
                AllJobs
                    |> toPath
                    |> Expect.equal [ "api", "v1", "jobs" ]
        , test "JobBuild" <|
            \_ ->
                JobBuild
                    { buildName = "build"
                    , jobName = "job"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "jobs", "job", "builds", "build" ]
        , test "JobBuilds, no page" <|
            \_ ->
                JobBuilds
                    { jobName = "job"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "jobs", "job", "builds" ]
        , test "JobBuilds, has page" <|
            \_ ->
                JobBuilds
                    { jobName = "job"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "jobs", "job", "builds" ]
        , test "Build" <|
            \_ ->
                Build 1
                    |> toPath
                    |> Expect.equal [ "api", "v1", "builds", "1" ]
        , test "BuildPlan" <|
            \_ ->
                BuildPlan 1
                    |> toPath
                    |> Expect.equal [ "api", "v1", "builds", "1", "plan" ]
        , test "BuildPrep" <|
            \_ ->
                BuildPrep 1
                    |> toPath
                    |> Expect.equal [ "api", "v1", "builds", "1", "preparation" ]
        , test "Resource" <|
            \_ ->
                Resource
                    { resourceName = "resource"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "resources", "resource" ]
        , test "ResourceVersions, no page" <|
            \_ ->
                ResourceVersions
                    { resourceName = "resource"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "resources", "resource", "versions" ]
        , test "ResourceVersions, has page" <|
            \_ ->
                ResourceVersions
                    { resourceName = "resource"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "resources", "resource", "versions" ]
        , test "ResourceVersionInputTo" <|
            \_ ->
                ResourceVersionInputTo
                    { versionID = 1
                    , resourceName = "resource"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "resources", "resource", "versions", "1", "input_to" ]
        , test "ResourceVersionOutputOf" <|
            \_ ->
                ResourceVersionOutputOf
                    { versionID = 1
                    , resourceName = "resource"
                    , pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "resources", "resource", "versions", "1", "output_of" ]
        , test "Resources" <|
            \_ ->
                Resources
                    { pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline", "resources" ]
        , test "BuildResources" <|
            \_ ->
                BuildResources 1
                    |> toPath
                    |> Expect.equal [ "api", "v1", "builds", "1", "resources" ]
        , test "AllResources" <|
            \_ ->
                AllResources
                    |> toPath
                    |> Expect.equal [ "api", "v1", "resources" ]
        , test "Check" <|
            \_ ->
                Check 1
                    |> toPath
                    |> Expect.equal [ "api", "v1", "checks", "1" ]
        , test "AllPipelines" <|
            \_ ->
                AllPipelines
                    |> toPath
                    |> Expect.equal [ "api", "v1", "pipelines" ]
        , test "Pipeline" <|
            \_ ->
                Pipeline
                    { pipelineName = "pipeline"
                    , teamName = "team"
                    }
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines", "pipeline" ]
        , test "AllTeams" <|
            \_ ->
                AllTeams
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams" ]
        , test "TeamPipelines" <|
            \_ ->
                TeamPipelines "team"
                    |> toPath
                    |> Expect.equal [ "api", "v1", "teams", "team", "pipelines" ]
        , test "ClusterInfo" <|
            \_ ->
                ClusterInfo
                    |> toPath
                    |> Expect.equal [ "api", "v1", "info" ]
        , test "UserInfo" <|
            \_ ->
                UserInfo
                    |> toPath
                    |> Expect.equal [ "sky", "userinfo" ]
        , test "Logout" <|
            \_ ->
                Logout
                    |> toPath
                    |> Expect.equal [ "sky", "logout" ]
        ]