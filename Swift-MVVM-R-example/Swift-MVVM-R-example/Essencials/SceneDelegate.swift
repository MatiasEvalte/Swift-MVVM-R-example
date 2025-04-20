
import UIKit

// MARK: - SceneDelegate

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  var router: AppRouter?
  
  /// Chamado quando a cena está sendo criada e conectada ao app.
  /// Aqui você configura e apresenta a interface da janela (window).
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let router = AppRouter(window: window)
    self.window = window
    self.router = router
    router.start()
  }
  
  /// Chamado quando a cena (window) é desconectada.
  /// Isso pode acontecer quando a app é enviada para o background e o sistema decide liberar recursos.
  /// Use para limpar ou salvar estado relacionado à cena.
  func sceneDidDisconnect(_ scene: UIScene) { }
  
  /// Chamado quando a cena entra em primeiro plano e se torna ativa (por exemplo, quando o usuário volta para o app).
  /// Bom momento para retomar tarefas que foram pausadas.
  func sceneDidBecomeActive(_ scene: UIScene) { }
  
  /// Chamado quando a cena está prestes a perder o foco (por exemplo, ao receber uma ligação ou notificação).
  /// Use para pausar atividades em andamento, como timers, animações ou gravação de áudio.
  func sceneWillResignActive(_ scene: UIScene) { }
  
  /// Chamado quando a cena está voltando do background para o foreground (visível novamente).
  /// Bom para desfazer mudanças feitas quando foi para o background.
  func sceneWillEnterForeground(_ scene: UIScene) { }
  
  /// Chamado quando a cena entra em background (por exemplo, o usuário pressiona o botão home).
  /// Ideal para salvar dados, liberar recursos, e armazenar o estado atual da interface.
  func sceneDidEnterBackground(_ scene: UIScene) { }
}
