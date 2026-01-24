import { ref } from 'vue'

export const isAnySpeechPlaying = ref(false)

export const waitForSpeechAvailability = async () => {
  while (isAnySpeechPlaying.value) {
    await new Promise(resolve => setTimeout(resolve, 50))
  }
}
