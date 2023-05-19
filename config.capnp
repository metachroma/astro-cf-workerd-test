using Workerd = import "/workerd/workerd.capnp";

const config :Workerd.Config = (
  services = [
    (name = "main", worker = .mainWorker),
    (name = "site-files", disk = "./dist"),
    (name = "another", worker = .anotherWorker),
  ],

  sockets = [
    # Serve HTTP on port 8080.
    ( name = "http",
      address = "*:8080",
      http = (),
      service = "main"
    ),
    ( name="http",
      address="*:8081",
      http=(),
      service="another"
    )
  ]
);

const mainWorker :Workerd.Worker = (
  modules = [
    (name = "main", esModule = embed "./dist/_worker.js")
  ],
  compatibilityDate = "2023-02-28",
  bindings = [
    (name = "ASSETS", service = "site-files"),
  ]
);

const anotherWorker :Workerd.Worker = (
  modules = [
    (name = "main", esModule = embed "./dist/_worker.js")
  ],
  compatibilityDate = "2023-02-28",
  bindings = [
    (name = "ASSETS", service = "site-files"),
  ]
);
