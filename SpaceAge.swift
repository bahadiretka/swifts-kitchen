//  Created by Bahadir Etka Kilinc


struct SpaceAge{
    var seconds: Int
    var onEarth: Double{
        return Double(seconds) / 31557600
    }
    var onMercury:Double{
        return onEarth / 0.2408467
    }
    var  onVenus: Double{
        return onEarth / 0.61519726
    }
    var onMars: Double{
        return onEarth / 1.8808158
    }
    var onJupiter: Double{
        return onEarth / 11.862615
    }
    var onSaturn: Double{
        return onEarth / 29.447498
    }
    var onUranus: Double{
        return onEarth / 84.016846
    }
    var onNeptune: Double{
        return onEarth / 164.79132
    }
    init(_ seconds: Int){
        self.seconds = seconds
    }
    
}