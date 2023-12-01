import torch

# Verifica si CUDA está disponible
cuda_available = torch.cuda.is_available()

# Imprime el número y el nombre de las GPUs disponibles
if cuda_available:
    print(f"GPUs disponibles: {torch.cuda.device_count()}")
    for i in range(torch.cuda.device_count()):
        print(f"GPU {i}: {torch.cuda.get_device_name(i)}")
else:
    print("CUDA no está disponible.")
