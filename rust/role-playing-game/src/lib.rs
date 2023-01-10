pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health > 0 {
            return None
        }

        let mana = self.mana.map(|m| if self.level >= 10 { 100 } else { m });
        Some(Player { health: 100, mana, ..*self })
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        match self.mana {
            Some(m) if m >= mana_cost => {
                self.mana = Some(m - mana_cost);
                mana_cost * 2
            }
            Some(_) => 0,
            None => {
                self.health = self.health.max(mana_cost) - mana_cost;
                0
            }
        }
    }
}
