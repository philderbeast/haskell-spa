{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Api where

import Servant
import Network.Wai.Handler.Warp (run)
import Network.Wai (Application())

type YourApi
  = "v1" :> Get '[] ()

server :: Server YourApi
server = return ()

type AppAPI = YourApi :<|> Raw

app :: Application
app = serve (Proxy :: Proxy AppAPI) (server :<|> serveDirectory "ui/assets/")

runApp :: IO ()
runApp = run 3000 app
